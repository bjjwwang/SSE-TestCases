; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_44_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  call void %0(i32* noundef %1), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32* noundef %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !45
  %1 = load i32*, i32** %data.addr, align 8, !dbg !46
  %2 = bitcast i32* %1 to i8*, !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %3 = bitcast i32* %arraydecay to i8*, !dbg !46
  %4 = load i32*, i32** %data.addr, align 8, !dbg !46
  %5 = bitcast i32* %4 to i8*, !dbg !46
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !46
  %call = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #5, !dbg !46
  %7 = load i32*, i32** %data.addr, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !47
  %8 = load i32, i32* %arrayidx, align 4, !dbg !47
  call void @printIntLine(i32 noundef %8), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_44_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* noundef null), !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 noundef %conv), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_44_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_44_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !76, metadata !DIExpression()), !dbg !77
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !82
  store i32* %arraydecay, i32** %data, align 8, !dbg !83
  %0 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !84
  %1 = load i32*, i32** %data, align 8, !dbg !85
  call void %0(i32* noundef %1), !dbg !84
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32* noundef %data) #0 !dbg !87 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !90, metadata !DIExpression()), !dbg !92
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !92
  %1 = load i32*, i32** %data.addr, align 8, !dbg !93
  %2 = bitcast i32* %1 to i8*, !dbg !93
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !93
  %3 = bitcast i32* %arraydecay to i8*, !dbg !93
  %4 = load i32*, i32** %data.addr, align 8, !dbg !93
  %5 = bitcast i32* %4 to i8*, !dbg !93
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !93
  %call = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #5, !dbg !93
  %7 = load i32*, i32** %data.addr, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !94
  %8 = load i32, i32* %arrayidx, align 4, !dbg !94
  call void @printIntLine(i32 noundef %8), !dbg !95
  ret void, !dbg !96
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_44_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 33, column: 11, scope: !11)
!20 = !DILocalVariable(name: "funcPtr", scope: !11, file: !12, line: 35, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !17}
!24 = !DILocation(line: 35, column: 12, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 36, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 36, column: 9, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 37, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 37, column: 9, scope: !11)
!35 = !DILocation(line: 40, column: 12, scope: !11)
!36 = !DILocation(line: 40, column: 10, scope: !11)
!37 = !DILocation(line: 42, column: 5, scope: !11)
!38 = !DILocation(line: 42, column: 13, scope: !11)
!39 = !DILocation(line: 43, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 21, type: !22, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !12, line: 21, type: !17)
!42 = !DILocation(line: 21, column: 27, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 24, type: !31)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 23, column: 5)
!45 = !DILocation(line: 24, column: 13, scope: !44)
!46 = !DILocation(line: 26, column: 9, scope: !44)
!47 = !DILocation(line: 27, column: 22, scope: !44)
!48 = !DILocation(line: 27, column: 9, scope: !44)
!49 = !DILocation(line: 29, column: 1, scope: !40)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_44_good", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!51 = !DILocation(line: 73, column: 5, scope: !50)
!52 = !DILocation(line: 74, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 85, type: !54, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!54 = !DISubroutineType(types: !55)
!55 = !{!18, !18, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 85, type: !18)
!60 = !DILocation(line: 85, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 85, type: !56)
!62 = !DILocation(line: 85, column: 27, scope: !53)
!63 = !DILocation(line: 88, column: 22, scope: !53)
!64 = !DILocation(line: 88, column: 12, scope: !53)
!65 = !DILocation(line: 88, column: 5, scope: !53)
!66 = !DILocation(line: 90, column: 5, scope: !53)
!67 = !DILocation(line: 91, column: 5, scope: !53)
!68 = !DILocation(line: 92, column: 5, scope: !53)
!69 = !DILocation(line: 95, column: 5, scope: !53)
!70 = !DILocation(line: 96, column: 5, scope: !53)
!71 = !DILocation(line: 97, column: 5, scope: !53)
!72 = !DILocation(line: 99, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!74 = !DILocalVariable(name: "data", scope: !73, file: !12, line: 62, type: !17)
!75 = !DILocation(line: 62, column: 11, scope: !73)
!76 = !DILocalVariable(name: "funcPtr", scope: !73, file: !12, line: 63, type: !21)
!77 = !DILocation(line: 63, column: 12, scope: !73)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !12, line: 64, type: !26)
!79 = !DILocation(line: 64, column: 9, scope: !73)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !12, line: 65, type: !31)
!81 = !DILocation(line: 65, column: 9, scope: !73)
!82 = !DILocation(line: 67, column: 12, scope: !73)
!83 = !DILocation(line: 67, column: 10, scope: !73)
!84 = !DILocation(line: 68, column: 5, scope: !73)
!85 = !DILocation(line: 68, column: 13, scope: !73)
!86 = !DILocation(line: 69, column: 1, scope: !73)
!87 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 50, type: !22, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!88 = !DILocalVariable(name: "data", arg: 1, scope: !87, file: !12, line: 50, type: !17)
!89 = !DILocation(line: 50, column: 31, scope: !87)
!90 = !DILocalVariable(name: "source", scope: !91, file: !12, line: 53, type: !31)
!91 = distinct !DILexicalBlock(scope: !87, file: !12, line: 52, column: 5)
!92 = !DILocation(line: 53, column: 13, scope: !91)
!93 = !DILocation(line: 55, column: 9, scope: !91)
!94 = !DILocation(line: 56, column: 22, scope: !91)
!95 = !DILocation(line: 56, column: 9, scope: !91)
!96 = !DILocation(line: 58, column: 1, scope: !87)
