; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_18_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 200, align 16, !dbg !22
  %1 = bitcast i8* %0 to i32*, !dbg !23
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = alloca i8, i64 400, align 16, !dbg !26
  %3 = bitcast i8* %2 to i32*, !dbg !27
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !25
  br label %source, !dbg !28

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !29), !dbg !30
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  store i32* %4, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !33, metadata !DIExpression()), !dbg !38
  %5 = bitcast [100 x i32]* %source1 to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %7 = bitcast i32* %6 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !39
  %8 = bitcast i32* %arraydecay to i8*, !dbg !39
  %9 = load i32*, i32** %data, align 8, !dbg !39
  %10 = bitcast i32* %9 to i8*, !dbg !39
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !39
  %call = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 400, i64 noundef %11) #5, !dbg !39
  %12 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %12, i64 0, !dbg !40
  %13 = load i32, i32* %arrayidx, align 4, !dbg !40
  call void @printIntLine(i32 noundef %13), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_18_good() #0 !dbg !43 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* noundef null), !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 noundef %conv), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_18_good(), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_18_bad(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = alloca i8, i64 200, align 16, !dbg !71
  %1 = bitcast i8* %0 to i32*, !dbg !72
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %2 = alloca i8, i64 400, align 16, !dbg !75
  %3 = bitcast i8* %2 to i32*, !dbg !76
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !74
  br label %source, !dbg !77

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !78), !dbg !79
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !80
  store i32* %4, i32** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !82, metadata !DIExpression()), !dbg !84
  %5 = bitcast [100 x i32]* %source1 to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !84
  %6 = load i32*, i32** %data, align 8, !dbg !85
  %7 = bitcast i32* %6 to i8*, !dbg !85
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !85
  %8 = bitcast i32* %arraydecay to i8*, !dbg !85
  %9 = load i32*, i32** %data, align 8, !dbg !85
  %10 = bitcast i32* %9 to i8*, !dbg !85
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !85
  %call = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 400, i64 noundef %11) #5, !dbg !85
  %12 = load i32*, i32** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %12, i64 0, !dbg !86
  %13 = load i32, i32* %arrayidx, align 4, !dbg !86
  call void @printIntLine(i32 noundef %13), !dbg !87
  ret void, !dbg !88
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_18_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !3)
!19 = !DILocation(line: 23, column: 11, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !3)
!21 = !DILocation(line: 24, column: 11, scope: !13)
!22 = !DILocation(line: 24, column: 34, scope: !13)
!23 = !DILocation(line: 24, column: 27, scope: !13)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 11, scope: !13)
!26 = !DILocation(line: 25, column: 35, scope: !13)
!27 = !DILocation(line: 25, column: 28, scope: !13)
!28 = !DILocation(line: 26, column: 5, scope: !13)
!29 = !DILabel(scope: !13, name: "source", file: !14, line: 27)
!30 = !DILocation(line: 27, column: 1, scope: !13)
!31 = !DILocation(line: 30, column: 12, scope: !13)
!32 = !DILocation(line: 30, column: 10, scope: !13)
!33 = !DILocalVariable(name: "source", scope: !34, file: !14, line: 32, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 32, column: 13, scope: !34)
!39 = !DILocation(line: 34, column: 9, scope: !34)
!40 = !DILocation(line: 35, column: 22, scope: !34)
!41 = !DILocation(line: 35, column: 9, scope: !34)
!42 = !DILocation(line: 37, column: 1, scope: !13)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_18_good", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!44 = !DILocation(line: 63, column: 5, scope: !43)
!45 = !DILocation(line: 64, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 76, type: !47, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!47 = !DISubroutineType(types: !48)
!48 = !{!4, !4, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !14, line: 76, type: !4)
!53 = !DILocation(line: 76, column: 14, scope: !46)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !14, line: 76, type: !49)
!55 = !DILocation(line: 76, column: 27, scope: !46)
!56 = !DILocation(line: 79, column: 22, scope: !46)
!57 = !DILocation(line: 79, column: 12, scope: !46)
!58 = !DILocation(line: 79, column: 5, scope: !46)
!59 = !DILocation(line: 81, column: 5, scope: !46)
!60 = !DILocation(line: 82, column: 5, scope: !46)
!61 = !DILocation(line: 83, column: 5, scope: !46)
!62 = !DILocation(line: 86, column: 5, scope: !46)
!63 = !DILocation(line: 87, column: 5, scope: !46)
!64 = !DILocation(line: 88, column: 5, scope: !46)
!65 = !DILocation(line: 90, column: 5, scope: !46)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 44, type: !15, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!67 = !DILocalVariable(name: "data", scope: !66, file: !14, line: 46, type: !3)
!68 = !DILocation(line: 46, column: 11, scope: !66)
!69 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !14, line: 47, type: !3)
!70 = !DILocation(line: 47, column: 11, scope: !66)
!71 = !DILocation(line: 47, column: 34, scope: !66)
!72 = !DILocation(line: 47, column: 27, scope: !66)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !14, line: 48, type: !3)
!74 = !DILocation(line: 48, column: 11, scope: !66)
!75 = !DILocation(line: 48, column: 35, scope: !66)
!76 = !DILocation(line: 48, column: 28, scope: !66)
!77 = !DILocation(line: 49, column: 5, scope: !66)
!78 = !DILabel(scope: !66, name: "source", file: !14, line: 50)
!79 = !DILocation(line: 50, column: 1, scope: !66)
!80 = !DILocation(line: 52, column: 12, scope: !66)
!81 = !DILocation(line: 52, column: 10, scope: !66)
!82 = !DILocalVariable(name: "source", scope: !83, file: !14, line: 54, type: !35)
!83 = distinct !DILexicalBlock(scope: !66, file: !14, line: 53, column: 5)
!84 = !DILocation(line: 54, column: 13, scope: !83)
!85 = !DILocation(line: 56, column: 9, scope: !83)
!86 = !DILocation(line: 57, column: 22, scope: !83)
!87 = !DILocation(line: 57, column: 9, scope: !83)
!88 = !DILocation(line: 59, column: 1, scope: !66)
