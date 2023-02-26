; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_18_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_18_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source1 = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 10, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 11, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  br label %source, !dbg !26

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !27), !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !29
  store i8* %2, i8** %data, align 8, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i8]* %source1, metadata !33, metadata !DIExpression()), !dbg !38
  %4 = bitcast [11 x i8]* %source1 to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_18_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !38
  %5 = load i8*, i8** %data, align 8, !dbg !39
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !39
  %6 = load i8*, i8** %data, align 8, !dbg !39
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !39
  %call = call i8* @__strcpy_chk(i8* noundef %5, i8* noundef %arraydecay, i64 noundef %7) #5, !dbg !39
  %8 = load i8*, i8** %data, align 8, !dbg !40
  call void @printLine(i8* noundef %8), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_18_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* noundef null), !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 noundef %conv), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_18_good(), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_18_bad(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source1 = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = alloca i8, i64 10, align 16, !dbg !70
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %1 = alloca i8, i64 11, align 16, !dbg !73
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !72
  br label %source, !dbg !74

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !75), !dbg !76
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !77
  store i8* %2, i8** %data, align 8, !dbg !78
  %3 = load i8*, i8** %data, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  call void @llvm.dbg.declare(metadata [11 x i8]* %source1, metadata !81, metadata !DIExpression()), !dbg !83
  %4 = bitcast [11 x i8]* %source1 to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !83
  %5 = load i8*, i8** %data, align 8, !dbg !84
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !84
  %6 = load i8*, i8** %data, align 8, !dbg !84
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !84
  %call = call i8* @__strcpy_chk(i8* noundef %5, i8* noundef %arraydecay, i64 noundef %7) #5, !dbg !84
  %8 = load i8*, i8** %data, align 8, !dbg !85
  call void @printLine(i8* noundef %8), !dbg !86
  ret void, !dbg !87
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_18_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !3)
!19 = !DILocation(line: 30, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !3)
!21 = !DILocation(line: 31, column: 12, scope: !13)
!22 = !DILocation(line: 31, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !3)
!24 = !DILocation(line: 32, column: 12, scope: !13)
!25 = !DILocation(line: 32, column: 37, scope: !13)
!26 = !DILocation(line: 33, column: 5, scope: !13)
!27 = !DILabel(scope: !13, name: "source", file: !14, line: 34)
!28 = !DILocation(line: 34, column: 1, scope: !13)
!29 = !DILocation(line: 37, column: 12, scope: !13)
!30 = !DILocation(line: 37, column: 10, scope: !13)
!31 = !DILocation(line: 38, column: 5, scope: !13)
!32 = !DILocation(line: 38, column: 13, scope: !13)
!33 = !DILocalVariable(name: "source", scope: !34, file: !14, line: 40, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 40, column: 14, scope: !34)
!39 = !DILocation(line: 42, column: 9, scope: !34)
!40 = !DILocation(line: 43, column: 19, scope: !34)
!41 = !DILocation(line: 43, column: 9, scope: !34)
!42 = !DILocation(line: 45, column: 1, scope: !13)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_18_good", scope: !14, file: !14, line: 71, type: !15, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!44 = !DILocation(line: 73, column: 5, scope: !43)
!45 = !DILocation(line: 74, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 86, type: !47, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !14, line: 86, type: !49)
!52 = !DILocation(line: 86, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !14, line: 86, type: !50)
!54 = !DILocation(line: 86, column: 27, scope: !46)
!55 = !DILocation(line: 89, column: 22, scope: !46)
!56 = !DILocation(line: 89, column: 12, scope: !46)
!57 = !DILocation(line: 89, column: 5, scope: !46)
!58 = !DILocation(line: 91, column: 5, scope: !46)
!59 = !DILocation(line: 92, column: 5, scope: !46)
!60 = !DILocation(line: 93, column: 5, scope: !46)
!61 = !DILocation(line: 96, column: 5, scope: !46)
!62 = !DILocation(line: 97, column: 5, scope: !46)
!63 = !DILocation(line: 98, column: 5, scope: !46)
!64 = !DILocation(line: 100, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!66 = !DILocalVariable(name: "data", scope: !65, file: !14, line: 54, type: !3)
!67 = !DILocation(line: 54, column: 12, scope: !65)
!68 = !DILocalVariable(name: "dataBadBuffer", scope: !65, file: !14, line: 55, type: !3)
!69 = !DILocation(line: 55, column: 12, scope: !65)
!70 = !DILocation(line: 55, column: 36, scope: !65)
!71 = !DILocalVariable(name: "dataGoodBuffer", scope: !65, file: !14, line: 56, type: !3)
!72 = !DILocation(line: 56, column: 12, scope: !65)
!73 = !DILocation(line: 56, column: 37, scope: !65)
!74 = !DILocation(line: 57, column: 5, scope: !65)
!75 = !DILabel(scope: !65, name: "source", file: !14, line: 58)
!76 = !DILocation(line: 58, column: 1, scope: !65)
!77 = !DILocation(line: 61, column: 12, scope: !65)
!78 = !DILocation(line: 61, column: 10, scope: !65)
!79 = !DILocation(line: 62, column: 5, scope: !65)
!80 = !DILocation(line: 62, column: 13, scope: !65)
!81 = !DILocalVariable(name: "source", scope: !82, file: !14, line: 64, type: !35)
!82 = distinct !DILexicalBlock(scope: !65, file: !14, line: 63, column: 5)
!83 = !DILocation(line: 64, column: 14, scope: !82)
!84 = !DILocation(line: 66, column: 9, scope: !82)
!85 = !DILocation(line: 67, column: 19, scope: !82)
!86 = !DILocation(line: 67, column: 9, scope: !82)
!87 = !DILocation(line: 69, column: 1, scope: !65)
