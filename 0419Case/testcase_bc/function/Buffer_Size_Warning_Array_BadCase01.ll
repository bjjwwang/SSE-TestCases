; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/function/Buffer_Size_Warning_Array_BadCase01.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/function/Buffer_Size_Warning_Array_BadCase01.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @BadCase01(i8** noundef %argv) #0 !dbg !9 {
entry:
  %argv.addr = alloca i8**, align 8
  %testName = alloca [256 x i8], align 16
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [256 x i8]* %testName, metadata !19, metadata !DIExpression()), !dbg !23
  %0 = bitcast [256 x i8]* %testName to i8*, !dbg !23
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 256, i1 false), !dbg !23
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %testName, i64 0, i64 0, !dbg !24
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !24
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !24
  %call = call i8* @__strncpy_chk(i8* noundef %arraydecay, i8* noundef %2, i64 noundef 256, i64 noundef 256) #4, !dbg !24
  ret void, !dbg !25
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/function/Buffer_Size_Warning_Array_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "BadCase01", scope: !10, file: !10, line: 18, type: !11, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!10 = !DIFile(filename: "function/Buffer_Size_Warning_Array_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !{}
!17 = !DILocalVariable(name: "argv", arg: 1, scope: !9, file: !10, line: 18, type: !13)
!18 = !DILocation(line: 18, column: 23, scope: !9)
!19 = !DILocalVariable(name: "testName", scope: !9, file: !10, line: 20, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 2048, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 256)
!23 = !DILocation(line: 20, column: 10, scope: !9)
!24 = !DILocation(line: 23, column: 5, scope: !9)
!25 = !DILocation(line: 24, column: 1, scope: !9)
