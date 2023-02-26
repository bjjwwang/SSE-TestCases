; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source1 = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  br label %source, !dbg !34

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !35), !dbg !36
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i32* %arraydecay, i32** %data, align 8, !dbg !38
  %0 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata [11 x i32]* %source1, metadata !41, metadata !DIExpression()), !dbg !43
  %1 = bitcast [11 x i32]* %source1 to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_bad.source to i8*), i64 44, i1 false), !dbg !43
  %2 = load i32*, i32** %data, align 8, !dbg !44
  %3 = bitcast i32* %2 to i8*, !dbg !44
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 0, !dbg !44
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !44
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 0, !dbg !44
  %call = call i64 @wcslen(i32* noundef %arraydecay3), !dbg !44
  %add = add i64 %call, 1, !dbg !44
  %mul = mul i64 %add, 4, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !44
  %6 = bitcast i32* %5 to i8*, !dbg !44
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !44
  %call4 = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !44
  %8 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* noundef %8), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* noundef null), !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 noundef %conv), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_good(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_bad(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source1 = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  br label %source, !dbg !78

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !79), !dbg !80
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !81
  store i32* %arraydecay, i32** %data, align 8, !dbg !82
  %0 = load i32*, i32** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  call void @llvm.dbg.declare(metadata [11 x i32]* %source1, metadata !85, metadata !DIExpression()), !dbg !87
  %1 = bitcast [11 x i32]* %source1 to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !87
  %2 = load i32*, i32** %data, align 8, !dbg !88
  %3 = bitcast i32* %2 to i8*, !dbg !88
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 0, !dbg !88
  %4 = bitcast i32* %arraydecay2 to i8*, !dbg !88
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source1, i64 0, i64 0, !dbg !88
  %call = call i64 @wcslen(i32* noundef %arraydecay3), !dbg !88
  %add = add i64 %call, 1, !dbg !88
  %mul = mul i64 %add, 4, !dbg !88
  %5 = load i32*, i32** %data, align 8, !dbg !88
  %6 = bitcast i32* %5 to i8*, !dbg !88
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !88
  %call4 = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !88
  %8 = load i32*, i32** %data, align 8, !dbg !89
  call void @printWLine(i32* noundef %8), !dbg !90
  ret void, !dbg !91
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 30, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 31, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 352, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 32, column: 13, scope: !11)
!34 = !DILocation(line: 33, column: 5, scope: !11)
!35 = !DILabel(scope: !11, name: "source", file: !12, line: 34)
!36 = !DILocation(line: 34, column: 1, scope: !11)
!37 = !DILocation(line: 37, column: 12, scope: !11)
!38 = !DILocation(line: 37, column: 10, scope: !11)
!39 = !DILocation(line: 38, column: 5, scope: !11)
!40 = !DILocation(line: 38, column: 13, scope: !11)
!41 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 40, type: !30)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!43 = !DILocation(line: 40, column: 17, scope: !42)
!44 = !DILocation(line: 43, column: 9, scope: !42)
!45 = !DILocation(line: 44, column: 20, scope: !42)
!46 = !DILocation(line: 44, column: 9, scope: !42)
!47 = !DILocation(line: 46, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_18_good", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!49 = !DILocation(line: 75, column: 5, scope: !48)
!50 = !DILocation(line: 76, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 88, type: !52, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!52 = !DISubroutineType(types: !53)
!53 = !{!22, !22, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 88, type: !22)
!58 = !DILocation(line: 88, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 88, type: !54)
!60 = !DILocation(line: 88, column: 27, scope: !51)
!61 = !DILocation(line: 91, column: 22, scope: !51)
!62 = !DILocation(line: 91, column: 12, scope: !51)
!63 = !DILocation(line: 91, column: 5, scope: !51)
!64 = !DILocation(line: 93, column: 5, scope: !51)
!65 = !DILocation(line: 94, column: 5, scope: !51)
!66 = !DILocation(line: 95, column: 5, scope: !51)
!67 = !DILocation(line: 98, column: 5, scope: !51)
!68 = !DILocation(line: 99, column: 5, scope: !51)
!69 = !DILocation(line: 100, column: 5, scope: !51)
!70 = !DILocation(line: 102, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 55, type: !17)
!73 = !DILocation(line: 55, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !12, line: 56, type: !25)
!75 = !DILocation(line: 56, column: 13, scope: !71)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !12, line: 57, type: !30)
!77 = !DILocation(line: 57, column: 13, scope: !71)
!78 = !DILocation(line: 58, column: 5, scope: !71)
!79 = !DILabel(scope: !71, name: "source", file: !12, line: 59)
!80 = !DILocation(line: 59, column: 1, scope: !71)
!81 = !DILocation(line: 62, column: 12, scope: !71)
!82 = !DILocation(line: 62, column: 10, scope: !71)
!83 = !DILocation(line: 63, column: 5, scope: !71)
!84 = !DILocation(line: 63, column: 13, scope: !71)
!85 = !DILocalVariable(name: "source", scope: !86, file: !12, line: 65, type: !30)
!86 = distinct !DILexicalBlock(scope: !71, file: !12, line: 64, column: 5)
!87 = !DILocation(line: 65, column: 17, scope: !86)
!88 = !DILocation(line: 68, column: 9, scope: !86)
!89 = !DILocation(line: 69, column: 20, scope: !86)
!90 = !DILocation(line: 69, column: 9, scope: !86)
!91 = !DILocation(line: 71, column: 1, scope: !71)