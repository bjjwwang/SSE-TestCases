; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41_badSink(i32* noundef %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !25
  %1 = load i32*, i32** %data.addr, align 8, !dbg !26
  %2 = bitcast i32* %1 to i8*, !dbg !26
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !26
  %3 = bitcast i32* %arraydecay to i8*, !dbg !26
  %4 = load i32*, i32** %data.addr, align 8, !dbg !26
  %5 = bitcast i32* %4 to i8*, !dbg !26
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !26
  %call = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #5, !dbg !26
  %7 = load i32*, i32** %data.addr, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !27
  %8 = load i32, i32* %arrayidx, align 4, !dbg !27
  call void @printIntLine(i32 noundef %8), !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41_bad() #0 !dbg !30 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !40, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay, i32** %data, align 8, !dbg !43
  %0 = load i32*, i32** %data, align 8, !dbg !44
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41_badSink(i32* noundef %0), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41_goodG2BSink(i32* noundef %data) #0 !dbg !47 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !52
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !52
  %1 = load i32*, i32** %data.addr, align 8, !dbg !53
  %2 = bitcast i32* %1 to i8*, !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %3 = bitcast i32* %arraydecay to i8*, !dbg !53
  %4 = load i32*, i32** %data.addr, align 8, !dbg !53
  %5 = bitcast i32* %4 to i8*, !dbg !53
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !53
  %call = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #5, !dbg !53
  %7 = load i32*, i32** %data.addr, align 8, !dbg !54
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !54
  %8 = load i32, i32* %arrayidx, align 4, !dbg !54
  call void @printIntLine(i32 noundef %8), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* noundef null), !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 noundef %conv), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41_good(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41_bad(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !87
  store i32* %arraydecay, i32** %data, align 8, !dbg !88
  %0 = load i32*, i32** %data, align 8, !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41_goodG2BSink(i32* noundef %0), !dbg !90
  ret void, !dbg !91
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41_badSink", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 21, type: !15)
!19 = !DILocation(line: 21, column: 85, scope: !11)
!20 = !DILocalVariable(name: "source", scope: !21, file: !12, line: 24, type: !22)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 23, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 24, column: 13, scope: !21)
!26 = !DILocation(line: 26, column: 9, scope: !21)
!27 = !DILocation(line: 27, column: 22, scope: !21)
!28 = !DILocation(line: 27, column: 9, scope: !21)
!29 = !DILocation(line: 29, column: 1, scope: !11)
!30 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41_bad", scope: !12, file: !12, line: 31, type: !31, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !DILocalVariable(name: "data", scope: !30, file: !12, line: 33, type: !15)
!34 = !DILocation(line: 33, column: 11, scope: !30)
!35 = !DILocalVariable(name: "dataBadBuffer", scope: !30, file: !12, line: 34, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 34, column: 9, scope: !30)
!40 = !DILocalVariable(name: "dataGoodBuffer", scope: !30, file: !12, line: 35, type: !22)
!41 = !DILocation(line: 35, column: 9, scope: !30)
!42 = !DILocation(line: 38, column: 12, scope: !30)
!43 = !DILocation(line: 38, column: 10, scope: !30)
!44 = !DILocation(line: 39, column: 78, scope: !30)
!45 = !DILocation(line: 39, column: 5, scope: !30)
!46 = !DILocation(line: 40, column: 1, scope: !30)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41_goodG2BSink", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!48 = !DILocalVariable(name: "data", arg: 1, scope: !47, file: !12, line: 46, type: !15)
!49 = !DILocation(line: 46, column: 89, scope: !47)
!50 = !DILocalVariable(name: "source", scope: !51, file: !12, line: 49, type: !22)
!51 = distinct !DILexicalBlock(scope: !47, file: !12, line: 48, column: 5)
!52 = !DILocation(line: 49, column: 13, scope: !51)
!53 = !DILocation(line: 51, column: 9, scope: !51)
!54 = !DILocation(line: 52, column: 22, scope: !51)
!55 = !DILocation(line: 52, column: 9, scope: !51)
!56 = !DILocation(line: 54, column: 1, scope: !47)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_41_good", scope: !12, file: !12, line: 67, type: !31, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!58 = !DILocation(line: 69, column: 5, scope: !57)
!59 = !DILocation(line: 70, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !61, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!61 = !DISubroutineType(types: !62)
!62 = !{!16, !16, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 82, type: !16)
!67 = !DILocation(line: 82, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 82, type: !63)
!69 = !DILocation(line: 82, column: 27, scope: !60)
!70 = !DILocation(line: 85, column: 22, scope: !60)
!71 = !DILocation(line: 85, column: 12, scope: !60)
!72 = !DILocation(line: 85, column: 5, scope: !60)
!73 = !DILocation(line: 87, column: 5, scope: !60)
!74 = !DILocation(line: 88, column: 5, scope: !60)
!75 = !DILocation(line: 89, column: 5, scope: !60)
!76 = !DILocation(line: 92, column: 5, scope: !60)
!77 = !DILocation(line: 93, column: 5, scope: !60)
!78 = !DILocation(line: 94, column: 5, scope: !60)
!79 = !DILocation(line: 96, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !31, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 59, type: !15)
!82 = !DILocation(line: 59, column: 11, scope: !80)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !12, line: 60, type: !36)
!84 = !DILocation(line: 60, column: 9, scope: !80)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !12, line: 61, type: !22)
!86 = !DILocation(line: 61, column: 9, scope: !80)
!87 = !DILocation(line: 63, column: 12, scope: !80)
!88 = !DILocation(line: 63, column: 10, scope: !80)
!89 = !DILocation(line: 64, column: 82, scope: !80)
!90 = !DILocation(line: 64, column: 5, scope: !80)
!91 = !DILocation(line: 65, column: 1, scope: !80)
