; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_01_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_01_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 10, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 11, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  store i8* %2, i8** %data, align 8, !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_01_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !35
  %5 = load i8*, i8** %data, align 8, !dbg !36
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !36
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !36
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !36
  %add = add i64 %call, 1, !dbg !36
  %mul = mul i64 %add, 1, !dbg !36
  %6 = load i8*, i8** %data, align 8, !dbg !36
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !36
  %call2 = call i8* @__memcpy_chk(i8* noundef %5, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %7) #5, !dbg !36
  %8 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* noundef %8), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_01_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* noundef null), !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 noundef %conv), !dbg !54
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_01_good(), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_01_bad(), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !62 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = alloca i8, i64 10, align 16, !dbg !67
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %1 = alloca i8, i64 11, align 16, !dbg !70
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !69
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !71
  store i8* %2, i8** %data, align 8, !dbg !72
  %3 = load i8*, i8** %data, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !75, metadata !DIExpression()), !dbg !77
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !77
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !77
  %5 = load i8*, i8** %data, align 8, !dbg !78
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !78
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !78
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !78
  %add = add i64 %call, 1, !dbg !78
  %mul = mul i64 %add, 1, !dbg !78
  %6 = load i8*, i8** %data, align 8, !dbg !78
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !78
  %call2 = call i8* @__memcpy_chk(i8* noundef %5, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %7) #5, !dbg !78
  %8 = load i8*, i8** %data, align 8, !dbg !79
  call void @printLine(i8* noundef %8), !dbg !80
  ret void, !dbg !81
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_01_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!26 = !DILocation(line: 35, column: 12, scope: !13)
!27 = !DILocation(line: 35, column: 10, scope: !13)
!28 = !DILocation(line: 36, column: 5, scope: !13)
!29 = !DILocation(line: 36, column: 13, scope: !13)
!30 = !DILocalVariable(name: "source", scope: !31, file: !14, line: 38, type: !32)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 38, column: 14, scope: !31)
!36 = !DILocation(line: 41, column: 9, scope: !31)
!37 = !DILocation(line: 42, column: 19, scope: !31)
!38 = !DILocation(line: 42, column: 9, scope: !31)
!39 = !DILocation(line: 44, column: 1, scope: !13)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_01_good", scope: !14, file: !14, line: 69, type: !15, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!41 = !DILocation(line: 71, column: 5, scope: !40)
!42 = !DILocation(line: 72, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 84, type: !44, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !14, line: 84, type: !46)
!49 = !DILocation(line: 84, column: 14, scope: !43)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !14, line: 84, type: !47)
!51 = !DILocation(line: 84, column: 27, scope: !43)
!52 = !DILocation(line: 87, column: 22, scope: !43)
!53 = !DILocation(line: 87, column: 12, scope: !43)
!54 = !DILocation(line: 87, column: 5, scope: !43)
!55 = !DILocation(line: 89, column: 5, scope: !43)
!56 = !DILocation(line: 90, column: 5, scope: !43)
!57 = !DILocation(line: 91, column: 5, scope: !43)
!58 = !DILocation(line: 94, column: 5, scope: !43)
!59 = !DILocation(line: 95, column: 5, scope: !43)
!60 = !DILocation(line: 96, column: 5, scope: !43)
!61 = !DILocation(line: 98, column: 5, scope: !43)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!63 = !DILocalVariable(name: "data", scope: !62, file: !14, line: 53, type: !3)
!64 = !DILocation(line: 53, column: 12, scope: !62)
!65 = !DILocalVariable(name: "dataBadBuffer", scope: !62, file: !14, line: 54, type: !3)
!66 = !DILocation(line: 54, column: 12, scope: !62)
!67 = !DILocation(line: 54, column: 36, scope: !62)
!68 = !DILocalVariable(name: "dataGoodBuffer", scope: !62, file: !14, line: 55, type: !3)
!69 = !DILocation(line: 55, column: 12, scope: !62)
!70 = !DILocation(line: 55, column: 37, scope: !62)
!71 = !DILocation(line: 58, column: 12, scope: !62)
!72 = !DILocation(line: 58, column: 10, scope: !62)
!73 = !DILocation(line: 59, column: 5, scope: !62)
!74 = !DILocation(line: 59, column: 13, scope: !62)
!75 = !DILocalVariable(name: "source", scope: !76, file: !14, line: 61, type: !32)
!76 = distinct !DILexicalBlock(scope: !62, file: !14, line: 60, column: 5)
!77 = !DILocation(line: 61, column: 14, scope: !76)
!78 = !DILocation(line: 64, column: 9, scope: !76)
!79 = !DILocation(line: 65, column: 19, scope: !76)
!80 = !DILocation(line: 65, column: 9, scope: !76)
!81 = !DILocation(line: 67, column: 1, scope: !62)
