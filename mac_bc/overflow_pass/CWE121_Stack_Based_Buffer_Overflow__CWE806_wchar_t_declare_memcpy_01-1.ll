; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  %0 = load i32*, i32** %data, align 8, !dbg !31
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !40
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !41
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !41
  %5 = bitcast i32* %4 to i8*, !dbg !41
  %6 = load i32*, i32** %data, align 8, !dbg !41
  %call2 = call i64 @wcslen(i32* noundef %6), !dbg !41
  %mul = mul i64 %call2, 4, !dbg !41
  %call3 = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %5, i64 noundef %mul, i64 noundef 200) #5, !dbg !41
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !42
  store i32 0, i32* %arrayidx4, align 4, !dbg !43
  %7 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* noundef %7), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_01_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* noundef null), !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 noundef %conv), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_01_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_01_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !75
  store i32* %arraydecay, i32** %data, align 8, !dbg !76
  %0 = load i32*, i32** %data, align 8, !dbg !77
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !78
  %1 = load i32*, i32** %data, align 8, !dbg !79
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !79
  store i32 0, i32* %arrayidx, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !81, metadata !DIExpression()), !dbg !83
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !83
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !84
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !84
  %4 = load i32*, i32** %data, align 8, !dbg !84
  %5 = bitcast i32* %4 to i8*, !dbg !84
  %6 = load i32*, i32** %data, align 8, !dbg !84
  %call2 = call i64 @wcslen(i32* noundef %6), !dbg !84
  %mul = mul i64 %call2, 4, !dbg !84
  %call3 = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %5, i64 noundef %mul, i64 noundef 200) #5, !dbg !84
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !85
  store i32 0, i32* %arrayidx4, align 4, !dbg !86
  %7 = load i32*, i32** %data, align 8, !dbg !87
  call void @printWLine(i32* noundef %7), !dbg !88
  ret void, !dbg !89
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 25, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 26, column: 13, scope: !11)
!29 = !DILocation(line: 27, column: 12, scope: !11)
!30 = !DILocation(line: 27, column: 10, scope: !11)
!31 = !DILocation(line: 29, column: 13, scope: !11)
!32 = !DILocation(line: 29, column: 5, scope: !11)
!33 = !DILocation(line: 30, column: 5, scope: !11)
!34 = !DILocation(line: 30, column: 17, scope: !11)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 32, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 32, column: 17, scope: !36)
!41 = !DILocation(line: 34, column: 9, scope: !36)
!42 = !DILocation(line: 35, column: 9, scope: !36)
!43 = !DILocation(line: 35, column: 20, scope: !36)
!44 = !DILocation(line: 36, column: 20, scope: !36)
!45 = !DILocation(line: 36, column: 9, scope: !36)
!46 = !DILocation(line: 38, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memcpy_01_good", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!48 = !DILocation(line: 64, column: 5, scope: !47)
!49 = !DILocation(line: 65, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 77, type: !51, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!51 = !DISubroutineType(types: !52)
!52 = !{!22, !22, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 77, type: !22)
!57 = !DILocation(line: 77, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 77, type: !53)
!59 = !DILocation(line: 77, column: 27, scope: !50)
!60 = !DILocation(line: 80, column: 22, scope: !50)
!61 = !DILocation(line: 80, column: 12, scope: !50)
!62 = !DILocation(line: 80, column: 5, scope: !50)
!63 = !DILocation(line: 82, column: 5, scope: !50)
!64 = !DILocation(line: 83, column: 5, scope: !50)
!65 = !DILocation(line: 84, column: 5, scope: !50)
!66 = !DILocation(line: 87, column: 5, scope: !50)
!67 = !DILocation(line: 88, column: 5, scope: !50)
!68 = !DILocation(line: 89, column: 5, scope: !50)
!69 = !DILocation(line: 91, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 47, type: !17)
!72 = !DILocation(line: 47, column: 15, scope: !70)
!73 = !DILocalVariable(name: "dataBuffer", scope: !70, file: !12, line: 48, type: !25)
!74 = !DILocation(line: 48, column: 13, scope: !70)
!75 = !DILocation(line: 49, column: 12, scope: !70)
!76 = !DILocation(line: 49, column: 10, scope: !70)
!77 = !DILocation(line: 51, column: 13, scope: !70)
!78 = !DILocation(line: 51, column: 5, scope: !70)
!79 = !DILocation(line: 52, column: 5, scope: !70)
!80 = !DILocation(line: 52, column: 16, scope: !70)
!81 = !DILocalVariable(name: "dest", scope: !82, file: !12, line: 54, type: !37)
!82 = distinct !DILexicalBlock(scope: !70, file: !12, line: 53, column: 5)
!83 = !DILocation(line: 54, column: 17, scope: !82)
!84 = !DILocation(line: 56, column: 9, scope: !82)
!85 = !DILocation(line: 57, column: 9, scope: !82)
!86 = !DILocation(line: 57, column: 20, scope: !82)
!87 = !DILocation(line: 58, column: 20, scope: !82)
!88 = !DILocation(line: 58, column: 9, scope: !82)
!89 = !DILocation(line: 60, column: 1, scope: !70)
