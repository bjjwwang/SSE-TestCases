; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_04_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !35
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !39
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx3, align 4, !dbg !41
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay4, i32** %data, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !48
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !50
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx7, align 4, !dbg !52
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !53
  %1 = load i32*, i32** %data, align 8, !dbg !53
  %2 = bitcast i32* %1 to i8*, !dbg !53
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !53
  %mul = mul i64 %call10, 4, !dbg !53
  %call11 = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !53
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx12, align 4, !dbg !55
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  call void @printWLine(i32* noundef %arraydecay13), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_04_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* noundef null), !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 noundef %conv), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_04_good(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_04_bad(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !90
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !91
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !94
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !95
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !96
  store i32 0, i32* %arrayidx3, align 4, !dbg !97
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  store i32* %arraydecay4, i32** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !105
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !106
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !107
  store i32 0, i32* %arrayidx7, align 4, !dbg !108
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !109
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !109
  %1 = load i32*, i32** %data, align 8, !dbg !109
  %2 = bitcast i32* %1 to i8*, !dbg !109
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !109
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !109
  %mul = mul i64 %call10, 4, !dbg !109
  %call11 = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !109
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx12, align 4, !dbg !111
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  call void @printWLine(i32* noundef %arraydecay13), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !122
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !123
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !126
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !127
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx3, align 4, !dbg !129
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !130
  store i32* %arraydecay4, i32** %data, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !137
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !138
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !139
  store i32 0, i32* %arrayidx7, align 4, !dbg !140
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !141
  %0 = bitcast i32* %arraydecay8 to i8*, !dbg !141
  %1 = load i32*, i32** %data, align 8, !dbg !141
  %2 = bitcast i32* %1 to i8*, !dbg !141
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !141
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !141
  %mul = mul i64 %call10, 4, !dbg !141
  %call11 = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #4, !dbg !141
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !142
  store i32 0, i32* %arrayidx12, align 4, !dbg !143
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !144
  call void @printWLine(i32* noundef %arraydecay13), !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_04_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_memcpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 32, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 33, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 34, column: 13, scope: !11)
!34 = !DILocation(line: 35, column: 13, scope: !11)
!35 = !DILocation(line: 35, column: 5, scope: !11)
!36 = !DILocation(line: 36, column: 5, scope: !11)
!37 = !DILocation(line: 36, column: 25, scope: !11)
!38 = !DILocation(line: 37, column: 13, scope: !11)
!39 = !DILocation(line: 37, column: 5, scope: !11)
!40 = !DILocation(line: 38, column: 5, scope: !11)
!41 = !DILocation(line: 38, column: 27, scope: !11)
!42 = !DILocation(line: 42, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !44, file: !12, line: 40, column: 5)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 8)
!45 = !DILocation(line: 42, column: 14, scope: !43)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !12, line: 45, type: !30)
!47 = distinct !DILexicalBlock(scope: !11, file: !12, line: 44, column: 5)
!48 = !DILocation(line: 45, column: 17, scope: !47)
!49 = !DILocation(line: 46, column: 17, scope: !47)
!50 = !DILocation(line: 46, column: 9, scope: !47)
!51 = !DILocation(line: 47, column: 9, scope: !47)
!52 = !DILocation(line: 47, column: 21, scope: !47)
!53 = !DILocation(line: 50, column: 9, scope: !47)
!54 = !DILocation(line: 51, column: 9, scope: !47)
!55 = !DILocation(line: 51, column: 21, scope: !47)
!56 = !DILocation(line: 52, column: 20, scope: !47)
!57 = !DILocation(line: 52, column: 9, scope: !47)
!58 = !DILocation(line: 54, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_04_good", scope: !12, file: !12, line: 119, type: !13, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!60 = !DILocation(line: 121, column: 5, scope: !59)
!61 = !DILocation(line: 122, column: 5, scope: !59)
!62 = !DILocation(line: 123, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 135, type: !64, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!64 = !DISubroutineType(types: !65)
!65 = !{!22, !22, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 135, type: !22)
!70 = !DILocation(line: 135, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 135, type: !66)
!72 = !DILocation(line: 135, column: 27, scope: !63)
!73 = !DILocation(line: 138, column: 22, scope: !63)
!74 = !DILocation(line: 138, column: 12, scope: !63)
!75 = !DILocation(line: 138, column: 5, scope: !63)
!76 = !DILocation(line: 140, column: 5, scope: !63)
!77 = !DILocation(line: 141, column: 5, scope: !63)
!78 = !DILocation(line: 142, column: 5, scope: !63)
!79 = !DILocation(line: 145, column: 5, scope: !63)
!80 = !DILocation(line: 146, column: 5, scope: !63)
!81 = !DILocation(line: 147, column: 5, scope: !63)
!82 = !DILocation(line: 149, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 63, type: !17)
!85 = !DILocation(line: 63, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !12, line: 64, type: !25)
!87 = !DILocation(line: 64, column: 13, scope: !83)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !12, line: 65, type: !30)
!89 = !DILocation(line: 65, column: 13, scope: !83)
!90 = !DILocation(line: 66, column: 13, scope: !83)
!91 = !DILocation(line: 66, column: 5, scope: !83)
!92 = !DILocation(line: 67, column: 5, scope: !83)
!93 = !DILocation(line: 67, column: 25, scope: !83)
!94 = !DILocation(line: 68, column: 13, scope: !83)
!95 = !DILocation(line: 68, column: 5, scope: !83)
!96 = !DILocation(line: 69, column: 5, scope: !83)
!97 = !DILocation(line: 69, column: 27, scope: !83)
!98 = !DILocation(line: 78, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !100, file: !12, line: 76, column: 5)
!100 = distinct !DILexicalBlock(scope: !83, file: !12, line: 70, column: 8)
!101 = !DILocation(line: 78, column: 14, scope: !99)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !12, line: 81, type: !30)
!103 = distinct !DILexicalBlock(scope: !83, file: !12, line: 80, column: 5)
!104 = !DILocation(line: 81, column: 17, scope: !103)
!105 = !DILocation(line: 82, column: 17, scope: !103)
!106 = !DILocation(line: 82, column: 9, scope: !103)
!107 = !DILocation(line: 83, column: 9, scope: !103)
!108 = !DILocation(line: 83, column: 21, scope: !103)
!109 = !DILocation(line: 86, column: 9, scope: !103)
!110 = !DILocation(line: 87, column: 9, scope: !103)
!111 = !DILocation(line: 87, column: 21, scope: !103)
!112 = !DILocation(line: 88, column: 20, scope: !103)
!113 = !DILocation(line: 88, column: 9, scope: !103)
!114 = !DILocation(line: 90, column: 1, scope: !83)
!115 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!116 = !DILocalVariable(name: "data", scope: !115, file: !12, line: 95, type: !17)
!117 = !DILocation(line: 95, column: 15, scope: !115)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !12, line: 96, type: !25)
!119 = !DILocation(line: 96, column: 13, scope: !115)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !12, line: 97, type: !30)
!121 = !DILocation(line: 97, column: 13, scope: !115)
!122 = !DILocation(line: 98, column: 13, scope: !115)
!123 = !DILocation(line: 98, column: 5, scope: !115)
!124 = !DILocation(line: 99, column: 5, scope: !115)
!125 = !DILocation(line: 99, column: 25, scope: !115)
!126 = !DILocation(line: 100, column: 13, scope: !115)
!127 = !DILocation(line: 100, column: 5, scope: !115)
!128 = !DILocation(line: 101, column: 5, scope: !115)
!129 = !DILocation(line: 101, column: 27, scope: !115)
!130 = !DILocation(line: 105, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !132, file: !12, line: 103, column: 5)
!132 = distinct !DILexicalBlock(scope: !115, file: !12, line: 102, column: 8)
!133 = !DILocation(line: 105, column: 14, scope: !131)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !12, line: 108, type: !30)
!135 = distinct !DILexicalBlock(scope: !115, file: !12, line: 107, column: 5)
!136 = !DILocation(line: 108, column: 17, scope: !135)
!137 = !DILocation(line: 109, column: 17, scope: !135)
!138 = !DILocation(line: 109, column: 9, scope: !135)
!139 = !DILocation(line: 110, column: 9, scope: !135)
!140 = !DILocation(line: 110, column: 21, scope: !135)
!141 = !DILocation(line: 113, column: 9, scope: !135)
!142 = !DILocation(line: 114, column: 9, scope: !135)
!143 = !DILocation(line: 114, column: 21, scope: !135)
!144 = !DILocation(line: 115, column: 20, scope: !135)
!145 = !DILocation(line: 115, column: 9, scope: !135)
!146 = !DILocation(line: 117, column: 1, scope: !115)
